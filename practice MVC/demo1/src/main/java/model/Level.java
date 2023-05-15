package model;

public class Level {
    private int id;
    private String name;

    public Level(String name) {
        this.name = name;
    }

    public Level(int id, String name) {
        this.id = id;
        this.name = name;
    }


    public Level(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
