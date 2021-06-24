
package Model;


public class Usuario {
    private int IdUsuario;
    private String Nombre;
    private String Usuario;
    private String Password;
    private int Edad;
    private String Sexo;

    public Usuario() {
    }

    public Usuario(String Nombre, String Usuario, String Password, int Edad, String Sexo) {
        
        this.Nombre = Nombre;
        this.Usuario = Usuario;
        this.Password = Password;
        this.Edad = Edad;
        this.Sexo = Sexo;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getUsuario() {
        return Usuario;
    }

    public String getPassword() {
        return Password;
    }   

    public int getEdad() {
        return Edad;
    }

    public String getSexo() {
        return Sexo;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
    
    public void setEdad(int Edad) {
        this.Edad = Edad;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }
    
}
