package com.example.luisalberto.hackmomentum;
import android.widget.EditText;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.TextView;


public class MainActivity extends ActionBarActivity {

    Button Button;
    EditText  username;
    EditText  password;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Instanciar elemento
        Button btnIr = (Button) findViewById(R.id.button);
        username = (EditText)findViewById(R.id.editText1);
        password = (EditText)findViewById(R.id.editText2);

        // Accion del boton
        btnIr.setOnClickListener(new OnClickListener() {

            //@Override
            public void onClick(View v) {

                if(password.equals("Misa") && username.equals("Test") )
                {
                    Intent i = new Intent(this, administrador.xml);

                    //Inicia la actividad
                    startActivity(i);
                }else{
                    if(password.equals("123") && username.equals("john") )
                    {
                        Intent i = new Intent(this, listaadmin.xml);

                        //Inicia la actividad
                        startActivity(i);

                    }else{
                        Intent i = new Intent(this, login.xml);

                        //Inicia la actividad
                        startActivity(i);


                    }


                }
            }
        });
    }



    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
