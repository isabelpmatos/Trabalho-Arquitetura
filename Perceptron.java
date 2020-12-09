public class Perceptron {
//Neurônio único para somar dois valores
//Feito com auxílio dos slides disponibilizados pelo professor
    // programa criado em linguagem java para depois ser convertido para mips
    // alunas: Daniella Rodrigues de Melo e Isabel Pinheiro Matos 

    public static void main(String[] args) {

        // definir entrada
        float entrada = 1;

        // definir pesos: passo 1
        float peso1 = (float) 0.0;
        float peso2 = (float) 0.9;

        // definir taxa de erro: passo 2
        float erroGlobal = (float) 1.4;

        //  taxa de aprendizado (velocidade na qual o sistema esta caminhando)
        float taxaAprendizado = (float) 0.055;

        float saidaesperada = entrada + entrada;
        float resultado;

        //Treino do neuronio
        for (int i = 1; i < 6; i++) {

            entrada = i;
            saidaesperada = entrada + entrada;
            erroGlobal = saidaesperada - (peso1 + peso2) * entrada;
            System.out.println("Treino: ");
            System.out.println("taxaErro = " + erroGlobal);
            peso1 = peso1 + erroGlobal * taxaAprendizado * entrada;
            peso2 = peso2 + erroGlobal * taxaAprendizado * entrada;

            System.out.println("peso 1 = " + peso1);
            System.out.println("peso 2 = " + peso2);
            erroGlobal = saidaesperada - peso1 - peso2;

        }

        //Teste do neuronio
        for (int i = 1; i < 11; i++) {

            entrada = i;
            resultado = entrada * peso1 + entrada * peso2;
            System.out.println("Saída: ");
            System.out.println(entrada + " + " + entrada + " = " + resultado);

        }

    }

}