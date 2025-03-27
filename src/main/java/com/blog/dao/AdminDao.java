/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.dao;

import com.blog.entity.Admin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author snghr
 */
public class AdminDao {
    private final SessionFactory factory;

    public AdminDao(SessionFactory factory) {
        this.factory=factory;
    }
    
    public void saveAdmin(Admin admin){
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            session.save(admin);
            tx.commit();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public Admin getAdminByEmailAndPassword(String email, String password){
        Admin admin=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("from Admin as a where a.email=:email and a.password=:password");
        q.setParameter("email", email);
        q.setParameter("password", password);
        admin=(Admin)q.uniqueResult();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return admin;
    }
    
    public boolean updateAdmin(int id,String value, String action){
        boolean b=false;
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            Admin a=session.get(Admin.class, id);
            if(action.equals("password")){
            a.setPassword(value);
            }else if(action.equals("photo")){
                a.setPhoto(value);
            }else if(action.equals("")){
                
            }
            session.update(a);
            tx.commit();
            session.close();
            b=true;
        }catch(Exception e){
            if(tx!=null){
            tx.rollback();
            }
            e.printStackTrace();
        }
        return b;
    }
}
