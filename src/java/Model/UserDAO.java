
package Model;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;

public class UserDAO {
    public user Authenticate(String uname)
    {
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        user u = null;
        try{ 
            cf = new Configuration();
            cf.configure();
            sf = cf.buildSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            Query q = session.createQuery("from user where uname = :uname");
            q.setString("uname",uname);
            u = (user)q.uniqueResult();
            t.commit();
            return u;
           }catch(Exception e ){
             e.printStackTrace();
            }
        
        finally{
            session.close();
            sf.close();
        }
        return u;
    }
    
    
    public admin ad(String uname){
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session s = null;
        Transaction t = null;
        admin a = null;
        try{
            
            cf = new Configuration();
            cf.configure();
            sf = cf.buildSessionFactory();
            s = sf.openSession();
            t = s.beginTransaction();
            Query q = s.createQuery("from admin where uname = :uname");
            q.setString("uname", uname);
            a = (admin)q.uniqueResult();
            t.commit();
            return a;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
       
        return a;
    }
    
    public boolean checkStu(String uname , String pass){
        user u = null;
        u = Authenticate(uname);
        if(u!=null && uname.equals(u.getUname()) && pass.equals(u.getPass()) ){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean checkAdmin(String uname , String pass){
        admin a = null;
        a = ad(uname);
        if(a!=null && uname.equals(a.getUname()) && pass.equals(a.getPass()))
            return true;
        else
            return false;
    }
    
    public void signup(user u)
    {
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try{
            
            cf = new Configuration();
            cf.configure();
            sf = cf.buildSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(u);
            t.commit();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        finally{
            session.close();
            sf.close();
        }

 }
    
    
    public void AddSch(schedules s){
        
        Configuration cf  = null;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        
        try{
            
            cf = new Configuration();
            cf.configure();
            sf = cf.buildSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(s);
            t.commit();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        finally{
            
            session.close();
            sf.close();
            
        }
        
    }
}