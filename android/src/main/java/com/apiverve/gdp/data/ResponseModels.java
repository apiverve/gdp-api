// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     GDPDataData data = Converter.fromJsonString(jsonString);

package com.apiverve.gdp.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static GDPDataData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(GDPDataData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(GDPDataData.class);
        writer = mapper.writerFor(GDPDataData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// GDPDataData.java

package com.apiverve.gdp.data;

import com.fasterxml.jackson.annotation.*;

public class GDPDataData {
    private String country;
    private String countryName;
    private String currency;
    private long year;
    private long count;
    private Historical[] historical;

    @JsonProperty("country")
    public String getCountry() { return country; }
    @JsonProperty("country")
    public void setCountry(String value) { this.country = value; }

    @JsonProperty("countryName")
    public String getCountryName() { return countryName; }
    @JsonProperty("countryName")
    public void setCountryName(String value) { this.countryName = value; }

    @JsonProperty("currency")
    public String getCurrency() { return currency; }
    @JsonProperty("currency")
    public void setCurrency(String value) { this.currency = value; }

    @JsonProperty("year")
    public long getYear() { return year; }
    @JsonProperty("year")
    public void setYear(long value) { this.year = value; }

    @JsonProperty("count")
    public long getCount() { return count; }
    @JsonProperty("count")
    public void setCount(long value) { this.count = value; }

    @JsonProperty("historical")
    public Historical[] getHistorical() { return historical; }
    @JsonProperty("historical")
    public void setHistorical(Historical[] value) { this.historical = value; }
}

// Historical.java

package com.apiverve.gdp.data;

import com.fasterxml.jackson.annotation.*;

public class Historical {
    private long year;
    private long gdp;
    private String gdpFormatted;
    private double gdpGrowth;
    private long gdpPerCapita;

    @JsonProperty("year")
    public long getYear() { return year; }
    @JsonProperty("year")
    public void setYear(long value) { this.year = value; }

    @JsonProperty("gdp")
    public long getGdp() { return gdp; }
    @JsonProperty("gdp")
    public void setGdp(long value) { this.gdp = value; }

    @JsonProperty("gdpFormatted")
    public String getGdpFormatted() { return gdpFormatted; }
    @JsonProperty("gdpFormatted")
    public void setGdpFormatted(String value) { this.gdpFormatted = value; }

    @JsonProperty("gdpGrowth")
    public double getGdpGrowth() { return gdpGrowth; }
    @JsonProperty("gdpGrowth")
    public void setGdpGrowth(double value) { this.gdpGrowth = value; }

    @JsonProperty("gdpPerCapita")
    public long getGdpPerCapita() { return gdpPerCapita; }
    @JsonProperty("gdpPerCapita")
    public void setGdpPerCapita(long value) { this.gdpPerCapita = value; }
}