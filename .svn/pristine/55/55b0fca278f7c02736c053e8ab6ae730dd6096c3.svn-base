/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ConnPoolInit;

/**
 *
 * @author stavros
 */


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.naming.InitialContext;
import javax.naming.Context;



import javax.sql.DataSource;

public class ConnPoolInit implements ServletContextListener {

    public static DataSource Datasource;

    /**
     *
     * @param arg0
     */
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
	System.out.println("Context Destroyed");
    }

    /**
     *	Initialises the Connection Pool (database connection)
     * @param arg0
     */
    @Override
    public void contextInitialized(ServletContextEvent arg0) {
	try {
	    Context initContext = new InitialContext();
	    Context context = (Context) initContext.lookup("java:/comp/env");
	    Datasource = (DataSource) context.lookup("jdbc/TedDB");

	    System.out.println("Context CreatedBLALBLALBLALBALBLABLAB");

	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}
    }
}

