
package Model;

import javax.persistence.*;


@Entity
public class schedules {
    
    @Id
    String number;
    String route,dropp,pickupp,time;

    public String getNumber() {
        return number;
    }

    public String getRoute() {
        return route;
    }

    public String getDropp() {
        return dropp;
    }

    public String getPickupp() {
        return pickupp;
    }

    public String getTime() {
        return time;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public void setDropp(String dropp) {
        this.dropp = dropp;
    }

    public void setPickupp(String pickupp) {
        this.pickupp = pickupp;
    }

    public void setTime(String time) {
        this.time = time;
    }

    
    
    
}
