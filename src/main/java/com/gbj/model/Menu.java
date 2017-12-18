package com.gbj.model;

public class Menu {
    private Integer menu_id;
    private String menu_name;
    private String url;
    private Integer father_menu;
    public Integer getMenu_id() {
        return this.menu_id;
    }
    public void setMenu_id(Integer menu_id ) {
        this.menu_id = menu_id;
    }
    public String getMenu_name() {
        return this.menu_name;
    }
    public void setMenu_name(String menu_name ) {
        this.menu_name = menu_name;
    }
    public String getUrl() {
        return this.url;
    }
    public void setUrl(String url ) {
        this.url = url;
    }
    public Integer getFather_menu() {
        return this.father_menu;
    }
    public void setFather_menu(Integer father_menu ) {
        this.father_menu = father_menu;
    }

}
