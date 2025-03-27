/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.dao;

import com.blog.entity.Blogger;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author snghr
 */
public class BloggerDao {
     private final SessionFactory factory;

    public BloggerDao(SessionFactory factory) {
        this.factory=factory;
    }
    public void saveBlogger(Blogger blogger){
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            session.save(blogger);
            tx.commit();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public Blogger getBloggerByEmailandPassword(String email, String password){
        Blogger blogger=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("from Blogger as b where b.email=:email and b.password=:password");
        q.setParameter("email", email);
        q.setParameter("password", password);
        blogger=(Blogger)q.uniqueResult();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return blogger;
    }
    
     public Blogger getBloggerById(int id){
        Blogger blogger=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("from Blogger as a where a.id=:id");
        q.setParameter("id", id);
        blogger=(Blogger)q.uniqueResult();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return blogger;
    }
    
     public List<Blogger> getAllBlogger(){
        List<Blogger> list=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("from Blogger");
        list=q.list();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean updateBloggerDetails(int id, String value,String action){
        boolean b=false;
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            Blogger blogger=session.get(Blogger.class, id);
            if(action.equals("password")){
            blogger.setPassword(value);
            }else if(action.equals("photo")){
                blogger.setPhoto(value);
            }else if(action.equals("status")){
                blogger.setStatus(value);
            }
            session.update(blogger);
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
