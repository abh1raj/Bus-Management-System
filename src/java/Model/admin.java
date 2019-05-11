
package Model;

import javax.persistence.*;

@Entity

public class admin {
    
    @Id
    String uname;
    
    String pass;

    public String getUname() {
        return uname;
    }

    public String getPass() {
        return pass;
    }
    
    
}
