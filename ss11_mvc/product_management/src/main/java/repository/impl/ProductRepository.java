package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Laptop Gaming MSI Katana GF66 11UE 836VN", 100000, "Intel Core i7-11800H 2.3GHz up to 4.6GHz 24MB", "MSI"));
        productList.add(new Product(2, "Laptop Gaming Acer Aspire 7 A715 42G R05G", 150000, "AMD Ryzen 5 – 5500U (6 nhân 12 luồng)", "Acer"));
        productList.add(new Product(3, "Laptop Gaming Gigabyte G5 GE 51VN263SH", 90000, "Intel® Core™ i5-12500H (2.5GHz~4.5GHz), 12 Cores", "Gigabyte"));
        productList.add(new Product(4, "Laptop ASUS TUF Gaming F15 FX506HC HN144W", 200000, "Intel® Core™ i5-11400H Processor 2.7 GHz ", "ASUS"));
        productList.add(new Product(4, "Laptop gaming ASUS ROG Strix G16 G614JU N3777W", 250000, "Intel® Core™ i7-13650HX Processor 2.6 GHz ", "ASUS"));
    }
    @Override
    public List<Product> getAll() {
        return productList;
    }


    @Override
    public void saveProduct(Product product) {
        productList.add(product);

    }

    @Override
    public void deleteProduct(int id) {
        for (int i = 0; i <productList.size() ; i++) {
            if(id==productList.get(i).getId()){
                productList.remove(i);
            }
        }
    }

    @Override
    public void editProduct(Product product) {
        int id = product.getId();
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()){
                productList.set(i,product);
                break;
            }
        }

    }
}
