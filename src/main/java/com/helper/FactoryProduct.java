package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author snghr
 */
public class FactoryProduct {
    private static SessionFactory factory;
    public static SessionFactory getFactory(){
        try{
            if(factory==null){
                factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return factory;
    }
}
