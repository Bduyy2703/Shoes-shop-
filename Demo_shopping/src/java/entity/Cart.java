//package entity;
//
//import java.io.Serializable;
//import java.util.ArrayList;
//
//public class Cart implements Serializable {
//
//    private ArrayList<LineItem> items;
//
//    public Cart() {
//        items = new ArrayList<LineItem>();
//    }
//
//    public ArrayList<LineItem> getItems() {
//        return items;
//    }
//
//    public int getCount() {
//        return items.size();
//    }
//
//    public void addItem(LineItem item) {
//        String id = item.getProduct().getId();
//        int quantity = item.getQuantity();
//        for (LineItem cartItem : items) {
//            if (cartItem.getProduct().getId().equals(id)) {
//                cartItem.setQuantity(quantity);
//                return;
//            }
//        }
//        items.add(item);
//    }
//
//    public void removeItem(LineItem item) {
//        String id = item.getProduct().getId();
//        for (int i = 0; i < items.size(); i++) {
//            LineItem lineItem = items.get(i);
//            if (lineItem.getProduct().getId().equals(id)) {
//                items.remove(i);
//                return;
//            }
//        }
//    }
//}