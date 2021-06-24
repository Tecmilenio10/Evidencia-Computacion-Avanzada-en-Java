
package Model;


public class Imc {
    private int IdIMC;
    private int IdUsuario;
    private String FechaIMC;
    private double Estatura;
    private double Peso;
    private double IMC;
    private String Nivel;

    public Imc() {
    }

    public Imc(int IdUsuario, String FechaIMC, double Estatura, double Peso, double IMC, String Nivel) {
        this.IdUsuario = IdUsuario;
        this.FechaIMC = FechaIMC;
        this.Estatura = Estatura;
        this.Peso = Peso;
        this.IMC = IMC;
        this.Nivel = Nivel;
    }

    public int getIdIMC() {
        return IdIMC;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public String getFechaIMC() {
        return FechaIMC;
    }

    public double getEstatura() {
        return Estatura;
    }

    public double getPeso() {
        return Peso;
    }

    public double getIMC() {
        return IMC;
    }

    public String getNivel() {
        return Nivel;
    }

    public void setIdIMC(int IdIMC) {
        this.IdIMC = IdIMC;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public void setFechaIMC(String FechaIMC) {
        this.FechaIMC = FechaIMC;
    }

    public void setEstatura(double Estatura) {
        this.Estatura = Estatura;
    }

    public void setPeso(double Peso) {
        this.Peso = Peso;
    }

    public void setIMC(double IMC) {
        this.IMC = IMC;
    }

    public void setNivel(String Nivel) {
        this.Nivel = Nivel;
    }
    
    public void setIMC(double Peso, double Estatura) {
        this.IMC = Peso/(Estatura*Estatura);
    }

    public void setNivel(double IMC) {
        String Nivel;
        if(IMC < 18.5){
            this.Nivel = "BAJO PESO";
        }else if(IMC <= 24.9){
            this.Nivel = "NORMAL";
        }else if(IMC <= 29.9){
            this.Nivel = "SOBREPESO";
        }else{
            this.Nivel = "OBESIDAD";
        }
    }
    
}
