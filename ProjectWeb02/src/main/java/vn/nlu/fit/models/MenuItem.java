package vn.nlu.fit.models;

public class MenuItem {
    private int id;
    private String menuName;
    private String icon;
    private String link;
    private int parentId;
    private String menuBackground;

    public MenuItem() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getMenuBackground() {
        return menuBackground;
    }

    public void setMenuBackground(String menuBackground) {
        this.menuBackground = menuBackground;
    }
}
