package controller;

import config.Conexion;
import Model.Imc;
import Model.Usuario;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Controlador {
    
    Conexion conexion = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(conexion.Conectar());
    ModelAndView modelAndView =  new ModelAndView();
    List datos;
    List datosIMC;
    int id;
    
    
    
    @RequestMapping(value = "login.htm", method = RequestMethod.GET)
    public ModelAndView login(){
        String sql = "select * from usuario";
        datos = this.jdbcTemplate.queryForList(sql);
        modelAndView.addObject("lista", datos);
        modelAndView.setViewName("login");
        return modelAndView;
    }
    
     @RequestMapping(value = "login.htm", method = RequestMethod.POST)
    public ModelAndView login(Usuario usuario, HttpServletRequest request){
        String sql = "select * from usuario where Usuario='"+ usuario.getUsuario() + "' and Password='" + usuario.getPassword() + "'";
        datos = this.jdbcTemplate.queryForList(sql);
        modelAndView.addObject("lista", datos);
        
        if(datos.isEmpty()){
             request.setAttribute("flag", null);  
            modelAndView.setViewName("login");            
        }else{
            modelAndView.setViewName("index");                 
        }
        
        return modelAndView;
    }
    
    @RequestMapping("index.htm")
    public ModelAndView listar(){
        String sql = "select * from usuario";
        datos = this.jdbcTemplate.queryForList(sql);
        modelAndView.addObject("lista", datos);
        modelAndView.setViewName("index");
        return modelAndView;
    }
    
    @RequestMapping("listaimc.htm")
    public ModelAndView listarimc(HttpServletRequest request){
        id = Integer.parseInt(request.getParameter("IdUsuario"));
        String sql = "select * from imc where IdUsuario=" + id;
        datos = this.jdbcTemplate.queryForList(sql);
        modelAndView.addObject("lista", datos);
        modelAndView.setViewName("listaimc");
        return modelAndView;
    }
    
    @RequestMapping(value = "agregarimc.htm", method = RequestMethod.GET)
    public ModelAndView agregarimc(){
        modelAndView.addObject(new Imc());
        modelAndView.setViewName("agregarimc");
        return modelAndView;
    }
    
    @RequestMapping(value = "agregarimc.htm", method = RequestMethod.POST)
    public ModelAndView agregar(Imc imc, HttpServletRequest request){
      if(imc.getEstatura() <= 2.5 && imc.getEstatura() >= 1.0 && imc.getPeso() > 0){
        String sql = "insert into imc (IdUsuario, FechaIMC, Estatura, Peso, IMC, Nivel) values (?,?,?,?,?,?)";
         double IMC = imc.getPeso()/(imc.getEstatura()*imc.getEstatura());
         String Nivel;
        if(IMC < 18.5){
            Nivel = "BAJO PESO";
        }else if(IMC <= 24.9){
            Nivel = "NORMAL";
        }else if(IMC <= 29.9){
            Nivel = "SOBREPESO";
        }else{
            Nivel = "OBESIDAD";
        }
            HttpSession sesion = request.getSession(false);
            Enumeration e=sesion.getAttributeNames();
            if(e.hasMoreElements()){
                id = Integer.parseInt(sesion.getAttribute("IdUsuario").toString());
            }

        this.jdbcTemplate.update(sql, id, imc.getFechaIMC(), imc.getEstatura(), imc.getPeso(), IMC, Nivel);
        
        sql = "select * from imc where IdUsuario=" + id;
        datos = this.jdbcTemplate.queryForList(sql);
        modelAndView.addObject("lista", datos);
        modelAndView.setViewName("listaimc");
        
      }else{
          if(imc.getPeso() <= 0){
              request.setAttribute("flag1", 1); 
          }
          if(imc.getEstatura() > 2.5 || imc.getEstatura() < 1.0){
            request.setAttribute("flag", 1);          
          }   
          modelAndView.setViewName("agregarimc");       
      }
      return modelAndView;
    }
    
    @RequestMapping(value = "agregar.htm", method = RequestMethod.GET)
    public ModelAndView agregar(){
        modelAndView.addObject(new Usuario());
        modelAndView.setViewName("agregar");
        return modelAndView;
    }
    
    @RequestMapping(value = "agregar.htm", method = RequestMethod.POST)
    public ModelAndView agregar(Usuario usuario, HttpServletRequest request){
        if(usuario.getEdad() > 15 ){
            String sql = "insert into usuario (Nombre, Usuario, Password, Edad, Sexo) values (?,?,?,?,?)";
            this.jdbcTemplate.update(sql, usuario.getNombre(), usuario.getUsuario(), usuario.getPassword(), usuario.getEdad(), usuario.getSexo());
            modelAndView.setViewName("login");
        }else{
            request.setAttribute("flag", 1);
            modelAndView.setViewName("agregar");
        }
        return modelAndView;
    }
    
    @RequestMapping(value="editar.htm", method = RequestMethod.GET)
    public ModelAndView Editar(HttpServletRequest request){
        id = Integer.parseInt(request.getParameter("IdUsuario"));
        String sql = "select * from usuario where IdUsuario = " + id;
        datos = this.jdbcTemplate.queryForList(sql);
        modelAndView.addObject("lista", datos);
        modelAndView.setViewName("editar");
        return modelAndView;
    }
    
    @RequestMapping(value = "editar.htm", method = RequestMethod.POST)
    public ModelAndView editar(Usuario usuario){
        String sql = "update usuario set Nombre=?, Usuario=?, Password=?, Edad=?, Sexo=? where IdUsuario=?";
        this.jdbcTemplate.update(sql, usuario.getNombre(), usuario.getUsuario(), usuario.getPassword(), usuario.getEdad(), usuario.getSexo(), usuario.getIdUsuario());
        
        sql = "select * from usuario where IdUsuario='"+ usuario.getIdUsuario() + "'";
        datos = this.jdbcTemplate.queryForList(sql);
        modelAndView.addObject("lista", datos);
        modelAndView.setViewName("index");
        return modelAndView;
    }
    
    @RequestMapping(value = "eliminar.htm", method = RequestMethod.GET)
    public ModelAndView eliminar(HttpServletRequest request){
        id = Integer.parseInt(request.getParameter("IdUsuario"));
        String sql = "delete from usuario where IdUsuario = " + id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/index.htm");
    }    
}
