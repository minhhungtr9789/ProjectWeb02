package vn.nlu.fit.models;

public class Brand {
    private int brandId;
    private String brandName;
    private String brandImg;

    public Brand() {

    }

    public Brand(int brandId, String brandName, String brandImg) {
        this.brandId = brandId;
        this.brandName = brandName;
        this.brandImg = brandImg;
    }

    public int getBrandId() {
        return brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public String getBrandImg() {
        return brandImg;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public void setBrandImg(String brandImg) {
        this.brandImg = brandImg;
    }
}
