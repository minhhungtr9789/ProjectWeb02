package vn.nlu.fit.models;

public class KeyValueOfPrices {
    private String key;
    private String value;

    public KeyValueOfPrices(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }
}
