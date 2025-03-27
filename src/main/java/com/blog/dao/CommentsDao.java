/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.dao;


import com.blog.entity.Comments;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author snghr
 */
public class CommentsDao {
   private final SessionFactory factory;

    public CommentsDao(SessionFactory factory) {
        this.factory=factory;
    }
    public void saveComment(Comments comment){
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            session.save(comment);
            tx.commit();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    
    public boolean deleteComment(int id){
        boolean b=false;
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            Comments comment=session.get(Comments.class, id);
            session.delete(comment);
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
    
    public int getNoOfCommentsByBloggerId(int bloggerId){
        int count=0;
        try{
        Session session=this.factory.openSession();
        String query="Select count(comment) from Comments as a where a.blog.bloggerId=:bloggerId";
        Query<Long> q=session.createQuery(query,Long.class);
        q.setParameter("bloggerId", bloggerId);
        long i=q.uniqueResult();
        count=(int)i;
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
    
     public List<Comments> getAllCommentsByBloggerId(int bloggerId){
        List<Comments> list=null;
        try{
        Session session=this.factory.openSession();
        String query="from Comments as a where a.blog.bloggerId=:bloggerId ORDER BY id DESC";
        Query q=session.createQuery(query);
        q.setParameter("bloggerId", bloggerId);
        list=q.list();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
     
      public List<Comments> getAllComments(){
        List<Comments> list=null;
        try{
        Session session=this.factory.openSession();
        String query="from Comments ORDER BY id DESC";
        Query q=session.createQuery(query);
        list=q.list();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
