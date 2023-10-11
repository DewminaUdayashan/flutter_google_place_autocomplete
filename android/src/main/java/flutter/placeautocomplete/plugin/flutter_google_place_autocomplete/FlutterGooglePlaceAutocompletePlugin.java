package flutter.placeautocomplete.plugin.flutter_google_place_autocomplete;

import static android.app.Activity.RESULT_OK;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.libraries.places.api.Places;
import com.google.android.libraries.places.api.model.AddressComponent;
import com.google.android.libraries.places.api.model.AddressComponents;
import com.google.android.libraries.places.api.model.DayOfWeek;
import com.google.android.libraries.places.api.model.LocalDate;
import com.google.android.libraries.places.api.model.OpeningHours;
import com.google.android.libraries.places.api.model.Period;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.android.libraries.places.api.model.PlusCode;
import com.google.android.libraries.places.api.model.SpecialDay;
import com.google.android.libraries.places.api.model.TimeOfWeek;
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
                final HashMap<String, Object> map = new HashMap<>();

                final Place place = Autocomplete.getPlaceFromIntent(data);
                // Handle the selected place
                final String placeName = place.getName();
                final String placeId = place.getId();
                final LatLng latlng = place.getLatLng();
                final LatLngBounds viewport = place.getViewport();
                final String address = place.getAddress();
                final AddressComponents addressComponents = place.getAddressComponents();
                final Place.BooleanPlaceAttributeValue curbsidePickup = place.getCurbsidePickup();
                final Place.BooleanPlaceAttributeValue delivery = place.getDelivery();
                final Place.BooleanPlaceAttributeValue dineIn = place.getDineIn();
                final Place.BooleanPlaceAttributeValue reservable = place.getReservable();
                final Place.BooleanPlaceAttributeValue servesBeer = place.getServesBeer();
                final Place.BooleanPlaceAttributeValue servesBreakfast = place.getServesBreakfast();
                final Place.BusinessStatus businessStatus = place.getBusinessStatus();
                final String editorialSummery = place.getEditorialSummary();
                final String iconUrl = place.getIconUrl();
                final OpeningHours openingHours = place.getOpeningHours();
                final OpeningHours currentOpeningHours = place.getCurrentOpeningHours();
                final List<OpeningHours> secondaryOpeningHours = place.getSecondaryOpeningHours();
                final String phoneNumber = place.getPhoneNumber();
                final PlusCode plusCode = place.getPlusCode();
                final Integer priceLevel = place.getPriceLevel();
                final Double rating = place.getRating();
                final Integer userRatingsTotal = place.getUserRatingsTotal();
                final Integer iconBackgroundColor = place.getIconBackgroundColor();
                final Place.BooleanPlaceAttributeValue servesBrunch = place.getServesBrunch();
                final Place.BooleanPlaceAttributeValue servesDinner = place.getServesDinner();
                final Place.BooleanPlaceAttributeValue servesLunch = place.getServesLunch();
                final Place.BooleanPlaceAttributeValue servesVegetarianFood = place.getServesVegetarianFood();
                final Place.BooleanPlaceAttributeValue servesWine = place.getServesWine();
                final Place.BooleanPlaceAttributeValue takeout = place.getTakeout();
                final Place.BooleanPlaceAttributeValue wheelchairAccessibleEntrance = place.getWheelchairAccessibleEntrance();
                final List<Place.Type> types = place.getTypes();
                final Integer utcOffset = place.getUtcOffsetMinutes();
                final Uri websiteUri = place.getWebsiteUri();

                if (placeId != null) map.put("id", placeId);

                if (placeName != null) map.put("name", placeName);

                if (latlng != null) {
                    final HashMap<String, Object> coordinatesMap = new HashMap<>();
                    coordinatesMap.put("latitude", latlng.latitude);
                    coordinatesMap.put("longitude", latlng.longitude);
                    map.put("coordinates", coordinatesMap);
                }

                if (viewport != null) {
                    final HashMap<String, Object> viewportMap = new HashMap<>();

                    final HashMap<String, Object> northEast = new HashMap<>();
                    northEast.put("latitude", viewport.northeast.latitude);
                    northEast.put("longitude", viewport.northeast.longitude);

                    final HashMap<String, Object> southWest = new HashMap<>();
                    southWest.put("latitude", viewport.southwest.latitude);
                    southWest.put("longitude", viewport.southwest.longitude);

                    viewportMap.put("northeast", northEast);
                    viewportMap.put("southwest", southWest);

                    map.put("viewport", viewportMap);
                }

                if (address != null) map.put("address", address);

                if (addressComponents != null) {
                    final List<HashMap<String, Object>> addressComponentsList = new ArrayList<>();
                    for (AddressComponent component : addressComponents.asList()) {
                        final HashMap<String, Object> co = new HashMap<>();
                        co.put("name", component.getName());
                        co.put("shortName", component.getShortName());
                        co.put("types", component.getTypes());
                        addressComponentsList.add(co);
                    }
                    map.put("addressComponents", addressComponentsList);
                }

                if (businessStatus != null) map.put("businessStatus", businessStatus.name());

                if (editorialSummery != null) map.put("editorialSummary", editorialSummery);
                if (iconUrl != null) map.put("iconUrl", iconUrl);
                if (openingHours != null)
                    map.put("openingHours", Utils.mapFromOpeningHours(openingHours));

                if (currentOpeningHours != null)
                    map.put("currentOpeningHours", Utils.mapFromOpeningHours(currentOpeningHours));

                if (secondaryOpeningHours != null) {
                    final List<HashMap<String, Object>> secondaryOpeningHoursList = new ArrayList<>();
                    for (OpeningHours hour : secondaryOpeningHours) {
                        secondaryOpeningHoursList.add(Utils.mapFromOpeningHours(hour));
                    }
                    map.put("secondaryOpeningHours", secondaryOpeningHoursList);
                }

                if (phoneNumber != null) {
                    map.put("phoneNumber", phoneNumber);
                }

                if (plusCode != null) {
                    final Map<String, Object> plusCodeMap = new HashMap<>();
                    plusCodeMap.put("compoundCode", plusCode.getCompoundCode());
                    plusCodeMap.put("globalCode", plusCode.getGlobalCode());
                    map.put("plusCode", plusCodeMap);
                }

                if (priceLevel != null) map.put("priceLevel", priceLevel);

                if (rating != null) map.put("rating", rating);

                if (userRatingsTotal != null) map.put("userRatingsTotal", userRatingsTotal);

                if (iconBackgroundColor != null)
                    map.put("iconBackgroundColor", iconBackgroundColor);

                map.put("curbsidePickup", curbsidePickup.name());
                map.put("delivery", delivery.name());
                map.put("dineIn", dineIn.name());
                map.put("reservable", reservable.name());
                map.put("servesBeer", servesBeer.name());
                map.put("servesBreakfast", servesBreakfast.name());
                map.put("servesBrunch", servesBrunch.name());
                map.put("servesDinner", servesDinner.name());
                map.put("servesLunch", servesLunch.name());
                map.put("servesVegetarianFood", servesVegetarianFood.name());
                map.put("servesWine", servesWine.name());
                map.put("takeout", takeout.name());
                map.put("wheelchairAccessibleEntrance", wheelchairAccessibleEntrance.name());

                if (types != null) {
                    final List<String> typesList = new ArrayList<>();
                    for (Place.Type type : types)
                        typesList.add(type.name());
                    map.put("types", typesList);
                }

                if (utcOffset != null) map.put("utcOffset", utcOffset);

                if (websiteUri != null) map.put("websiteUri", websiteUri.toString());

                Log.i("TAG", "onActivityResult: " + map);
                if (result != null) {
                    try {
                        result.success(map);
                    } catch (Exception e) {
                        Log.i("TAG", "onActivityResult: " + e);
                    }
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
