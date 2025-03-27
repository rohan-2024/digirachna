/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.dao;

import com.blog.entity.Blog;
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
public class BlogDao {
    private final SessionFactory factory;

    public BlogDao(SessionFactory factory) {
        this.factory=factory;
    }
    public void saveBlog(Blog blog){
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            session.save(blog);
            tx.commit();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public List<Blog> getAllBlogByBloggerId(int bloggerId){
        List<Blog> list=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("from Blog as a where a.bloggerId=:bloggerId");
        q.setParameter("bloggerId", bloggerId);
        list=q.list();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
     public List<Blog> getAllRecentBlogByBloggerId(int bloggerId){
        List<Blog> list=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("from Blog as a where a.bloggerId=:bloggerId ORDER BY id DESC");
        q.setParameter("bloggerId", bloggerId);
        list=q.list();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
     public Blog getBlogByBlogId(int id){
        Blog blog=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("from Blog as a where a.id=:id");
        q.setParameter("id", id);
        blog=(Blog)q.uniqueResult();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return blog;
    }
    
     public List<Blog> getAllBlog(){
        List<Blog> list=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("from Blog");
        list=q.list();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean updateBlog(int id, String title, String content, String category, String status){
        boolean b=false;
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            Blog blog=session.get(Blog.class, id);
            blog.setTitle(title);
            blog.setContent(content);
            blog.setCategory(category);
            blog.setStatus(status);
            session.update(blog);
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
    
    
    public boolean updateBlogThumbnail(int id,String thumbnail){
        boolean b=false;
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            Blog blog=session.get(Blog.class, id);
           blog.setThumbnail(thumbnail);
            session.update(blog);
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
    
    public boolean updateViewCount(int id){
        boolean b=false;
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            Blog blog=session.get(Blog.class, id);
            int view=blog.getViews();
            blog.setViews(view+1);
            session.update(blog);
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
    
    public boolean updateBlogComment(int id,Comments comment){
        boolean b=false;
        Transaction tx=null;
        try{
            Session session=this.factory.openSession();
            tx=session.beginTransaction();
            Blog blog=session.get(Blog.class, id);
            List<Comments> list=blog.getComments();
            list.add(comment);
            session.update(blog);
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
    
    public int getViewCountbyBloggerId(int bloggerId){
        int count=0;
        try{
        Session session=this.factory.openSession();
        String query="Select sum(views) from Blog as a where a.bloggerId=:bloggerId";
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
    
    public int getTotalViewCount(){
        int count=0;
        try{
        Session session=this.factory.openSession();
        String query="Select sum(views) from Blog";
        Query<Long> q=session.createQuery(query,Long.class);
        long i=q.uniqueResult();
        count=(int)i;
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
    
}
