/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.List;

/**
 *
 * @author snghr
 */
@Entity
public class Blog {
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    private String title;
    
    @Column(length = 255)
    private String content;
    private String blogDate;
    private String category;
    private String thumbnail;
    private int bloggerId;
    private String status;
    private int views;
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "blog")
    private List<Comments> comments;

    public Blog() {
    }

    public Blog(String title, String content, String blogDate, String category, String thumbnail, int bloggerId, String status, int views, List<Comments> comments) {
        this.title = title;
        this.content = content;
        this.blogDate = blogDate;
        this.category = category;
        this.thumbnail = thumbnail;
        this.bloggerId = bloggerId;
        this.status = status;
        this.views = views;
        this.comments = comments;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBlogDate() {
        return blogDate;
    }

    public void setBlogDate(String blogDate) {
        this.blogDate = blogDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(int bloggerId) {
        this.bloggerId = bloggerId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

 

    public List<Comments> getComments() {
        return comments;
    }

    public void setComments(List<Comments> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", title=" + title + ", content=" + content + ", blogDate=" + blogDate + ", category=" + category + ", thumbnail=" + thumbnail + ", bloggerId=" + bloggerId + ", status=" + status + ", views=" + views + ", comments=" + comments + '}';
    }

  
}
