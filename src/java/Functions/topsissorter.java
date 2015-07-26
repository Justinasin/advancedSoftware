package Functions;

import java.util.Comparator;

/**
 *
 * @author stavros
 */
public class topsissorter implements Comparator<houseInstance> {

    houseInstance best;
    houseInstance worst;

    public topsissorter() {
        
    }
    public topsissorter(houseInstance b,houseInstance w) {
        best=b;
        worst=w;
    }


    
    @Override
    public int compare(houseInstance one, houseInstance another) {
        int returnVal = 0;

        double score1 = score(one);
        double score2 = score(another);
        if (score1 < score2) {
            returnVal = -1;
        } else if (score1 > score2) {
            returnVal = 1;
        } else if (score1 == score2) {
            returnVal = 0;
        }
        return returnVal;

    }

    static double score(houseInstance house) {

        return house.dib / (house.diw + house.dib);
    }

}