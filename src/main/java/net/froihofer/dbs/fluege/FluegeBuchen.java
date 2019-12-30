package net.froihofer.dbs.fluege;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.util.List;
import javax.naming.InitialContext;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author Lorenz Froihofer
 * @version $Id: NeuerWein.java 1:3d18a343f773 2012/12/02 01:44:16 Lorenz Froihofer $
 */
public class FluegeBuchen extends HttpServlet {

  private static final Logger log = LoggerFactory.getLogger(FluegeBuchen.class);
  
  public static final String ERROR_MSG_PARAM = "BUCHUNG_SPEICHERUNG_FEHLERMELDUNG";
  public static final String SUCCESS_MSG_PARAM = "BUCHUNG_SPEICHERUNG_ERFOLGSMELDUNG";

  private EntityManagerFactory emf;
  
  @Override
  public void init() throws ServletException {
    super.init();
    emf = Persistence.createEntityManagerFactory("dbs-fluege");
  }
}
