package models;

import java.io.PrintWriter;

public class HomeModel<T> {
    private T[] array;
    public HomeModel(T[] array) {
        this.array = array;
    }

    public T[] getArray() {
        return array;
    }
    public void setArray(T[] array) {
        this.array = array;
    }
    public void displayArray(PrintWriter out) {
        for (T element : array) {
            out.println(element + ",");
        }
    }

}












