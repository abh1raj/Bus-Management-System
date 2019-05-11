
package Model;

import javax.persistence.*;


@Entity
public class user {
    private String uname,pass,address;
    @Id
    String phone;

    public String getPhone() {
        return phone;
    }


    public String getAdd() {
        return address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public void setAdd(String address) {
        this.address = address;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUname() {
        return uname;
    }

    public String getPass() {
        return pass;
    }
    
    public boolean equals(Object o)
    {
        user u = (user) o;
        if(uname.equals(u.getUname()) && pass.equals(u.getPass()))
            return true;
        else
            return false;
    }
    
}
