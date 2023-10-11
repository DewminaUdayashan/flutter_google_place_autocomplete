package flutter.placeautocomplete.plugin.flutter_google_place_autocomplete;

import static android.app.Activity.RESULT_OK;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.libraries.places.api.Places;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.android.libraries.places.widget.Autocomplete;
import com.google.android.libraries.places.widget.AutocompleteActivity;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/**
 * FlutterGooglePlaceAutocompletePlugin
 */
public class FlutterGooglePlaceAutocompletePlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    private static final int AUTOCOMPLETE_REQUEST_CODE = 1;
    private static final String TAG = "FlutterGooglePlaceAutocompletePlugin";
    private MethodChannel channel;
    private Activity activity;
    private Result result;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_google_place_autocomplete");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("initialize")) {
            initializePlacesAPI(call.argument("key"), result);
        } else if (call.method.equals("show_default")) {
            final Map<String, Object> data = call.arguments();
            showAutoCompleteOverlay(result, data);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }


    private void initializePlacesAPI(@NonNull String apiKey, @NonNull Result result) {
        if (apiKey.isEmpty()) {
            result.error("GPA_INIT_FAILED", "Invalid API key.", null);
            return;
        }
        try {
            Places.initialize(activity.getApplicationContext(), apiKey);
            result.success(true);
        } catch (Exception e) {
            result.error("GPA_INIT_FAILED", e.getMessage(), null);
        }
    }

    private void showAutoCompleteOverlay(@NonNull Result result, @NonNull Map<String, Object> data) {
        this.result = result;
        final List<String> fieldsFromFlutter = new ArrayList<>();
        fieldsFromFlutter.addAll((Collection<? extends String>) data.get("fields"));

        if (fieldsFromFlutter.isEmpty()) {
            result.error("GPA_FIELDS_EMPTY", null, null);
            return;
        }

        final List<Place.Field> fields = new ArrayList<>();

        final AutocompleteActivityMode mode = AutocompleteActivityMode.valueOf((String) data.get("mode"));

        for (String field : fieldsFromFlutter) {
            fields.add(Place.Field.valueOf(field));
        }

        // Start the autocomplete intent.
        final Intent intent = new Autocomplete.IntentBuilder(mode, fields).build(activity);

        activity.startActivityForResult(intent, AUTOCOMPLETE_REQUEST_CODE);
    }


    public boolean onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {

        if (requestCode == AUTOCOMPLETE_REQUEST_CODE && data != null) {
            if (resultCode == RESULT_OK) {
                final Place place = Autocomplete.getPlaceFromIntent(data);
                // Handle the selected place
                final String placeName = place.getName();
                final String placeId = place.getId();
                final LatLng latlng = place.getLatLng();

                final HashMap<String, Object> map = new HashMap<>();

                if (placeId != null) map.put("place_id", placeId);

                if (placeName != null) map.put("place_name", placeName);

                if (latlng != null) {
                    map.put("lat", latlng.latitude);
                    map.put("long", latlng.longitude);
                }

                if (result != null) {
                    result.success(map);
                }
            } else if (resultCode == AutocompleteActivity.RESULT_ERROR) {

                // Handle the error
                final Status status = Autocomplete.getStatusFromIntent(data);

                if (result != null) {
                    result.error("GPA_RESULT_ERROR", status.getStatusMessage(), null);
                }
            }
//            else if (resultCode == RESULT_CANCELED) {
//
//            }
        }
        return true;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
        binding.addActivityResultListener(this);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
        binding.addActivityResultListener(this);
    }

    @Override
    public void onDetachedFromActivity() {
        activity = null;
    }


}
