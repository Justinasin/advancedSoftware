package Functions;

import java.util.Comparator;

/**
 *
 * @author stavros
 */
public class comparescores implements Comparator<houseInstance>{

    @Override
    public int compare(houseInstance one, houseInstance another){
        int returnVal = 0;

    if(one.score < another.score){
        returnVal =  -1;
    }else if(one.score > another.score){
        returnVal =  1;
    }else if(one.score == another.score){
        returnVal =  0;
    }
    return returnVal;

    }
}