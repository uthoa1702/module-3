package model;

public class Student {
    private int id;
    private String name;
    private int age;
    private String country;
    private Level level;

    public Student() {
    }

    public Student(String name, int age, String country, Level level) {
        this.name = name;
        this.age = age;
        this.country = country;
        this.level = level;
    }

    public Student(int id, String name, int age, String country, Level level) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.country = country;
        this.level = level;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }
}