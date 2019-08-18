package controller;

import entity.Item;
import model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ShoppingCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action =req.getParameter("action");
        ProductModel pm = new ProductModel();
        HttpSession session = req.getSession();
        if(action.equals("ordernow")){

            if(session.getAttribute("cart")==null){
                List<Item> cart = new ArrayList<>();
                cart.add(new Item(pm.findbyId(Long.parseLong(req.getParameter("id"))),1));
                session.setAttribute("cart",cart);
            }else {
                List<Item> cart = (List<Item>) session.getAttribute("cart");
                int index= isExisting(Long.parseLong(req.getParameter("id")),cart);
                if(index==-1){
                    cart.add(new Item(pm.findbyId(Long.parseLong(req.getParameter("id"))),1));
                }else {
                    int quantity = cart.get(index).getQuantity()+1;  // cộng dồn sản phẩm mua nếu đã mua trước đó
                    cart.get(index).setQuantity(quantity);
                }

                session.setAttribute("cart",cart);
            }
            req.getRequestDispatcher("/cart.jsp").forward(req,resp);
        }
    }
    private int isExisting(long id, List<Item> cart){
        for(int i=0;i<cart.size();i++)
            if(cart.get(i).getP().getId()==id)
                return i;
            return -1;
    }
}
