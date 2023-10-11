package flutter.placeautocomplete.plugin.flutter_google_place_autocomplete;

import com.google.android.libraries.places.api.model.LocalDate;
import com.google.android.libraries.places.api.model.LocalTime;
import com.google.android.libraries.places.api.model.OpeningHours;
import com.google.android.libraries.places.api.model.Period;
import com.google.android.libraries.places.api.model.SpecialDay;
import com.google.android.libraries.places.api.model.TimeOfWeek;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Utils {
    public static HashMap<String, Object> mapFromOpeningHours(OpeningHours openingHours) {
        final HashMap<String, Object> openingHoursMap = new HashMap<>();
        final OpeningHours.HoursType hoursType = openingHours.getHoursType();
        if (hoursType != null) {
            openingHoursMap.put("hoursType", hoursType.name());
        }
        final List<Period> periods = openingHours.getPeriods();
        final List<HashMap<String, Object>> periodsList = new ArrayList<>();
        for (Period period : periods) {
            final TimeOfWeek open = period.getOpen();
            final TimeOfWeek close = period.getClose();
            final HashMap<String, Object> periodMap = new HashMap<>();
            if (open != null) {
                final HashMap<String, Object> openMap = new HashMap<>();
                final LocalDate date = open.getDate();
                String dateStr = null;
                if (date != null) dateStr = date.toString();
                openMap.put("date", dateStr);
                openMap.put("day", open.getDay().name());

                final LocalTime time = open.getTime();
                final HashMap<String, Object> timeMap = new HashMap<>();
                timeMap.put("hours", time.getHours());
                timeMap.put("minutes", time.getMinutes());
                openMap.put("time", timeMap);

                periodMap.put("open", openMap);
            }
            if (close != null) {
                final HashMap<String, Object> closeMap = new HashMap<>();
                final LocalDate date = close.getDate();
                String dateStr = null;
                if (date != null) dateStr = date.toString();
                closeMap.put("date", dateStr);
                closeMap.put("day", close.getDay().name());

                final LocalTime time = close.getTime();
                final HashMap<String, Object> timeMap = new HashMap<>();
                timeMap.put("hours", time.getHours());
                timeMap.put("minutes", time.getMinutes());
                closeMap.put("time", timeMap);

                periodMap.put("close", closeMap);
            }
            if (!periodMap.isEmpty()) {
                periodsList.add(periodMap);
            }
        }
        openingHoursMap.put("periods", periodsList);

        final List<SpecialDay> specialDays = openingHours.getSpecialDays();
        final List<HashMap<String, Object>> specialDaysList = new ArrayList<>();
        for (SpecialDay day : specialDays) {
            if (day == null) continue;
            final HashMap<String, Object> dayMap = new HashMap<>();
            dayMap.put("date", day.getDate().toString());
            dayMap.put("exceptional", day.isExceptional());
            specialDaysList.add(dayMap);
        }
        openingHoursMap.put("specialDays", specialDaysList);

        final List<String> weekDayText = openingHours.getWeekdayText();

        openingHoursMap.put("weekdayText", weekDayText);

        return openingHoursMap;
    }
}
