package com.example.gugudan_201607057baekseunghyun;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import java.util.Random;

public class SecondActivity extends AppCompatActivity {
    Button btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9;
    Button btn_Cancel, btn_Enter;
    int num = 0;
    int result = 0;
    TextView tv_gugu, tv_answer, tv_count;
    ProgressBar pb;
    Runnable myRun;

    Handler myHandler = new Handler();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        setTitle("구구단 게임 시작!");

        btn0 = (Button) findViewById(R.id.btn0);
        btn1 = (Button) findViewById(R.id.btn1);
        btn2 = (Button) findViewById(R.id.btn2);
        btn3 = (Button) findViewById(R.id.btn3);
        btn4 = (Button) findViewById(R.id.btn4);
        btn5 = (Button) findViewById(R.id.btn5);
        btn6 = (Button) findViewById(R.id.btn6);
        btn7 = (Button) findViewById(R.id.btn7);
        btn8 = (Button) findViewById(R.id.btn8);
        btn9 = (Button) findViewById(R.id.btn9);

        btn_Cancel = (Button) findViewById(R.id.cancel);
        btn_Enter = (Button) findViewById(R.id.enter);

        tv_gugu = (TextView) findViewById(R.id.text_gugu);
        tv_answer = (TextView) findViewById(R.id.text_answer);
        tv_count = (TextView) findViewById(R.id.text_count);

        pb = (ProgressBar) findViewById(R.id.progressBar);

        pb.setMax(60);
        pb.setProgress(0);

        tv_gugu.setText("");
        tv_answer.setText("");
        tv_count.setText("0");

        myRun = new Runnable() {
            @Override
            public void run() {
                if(pb.getProgress() < 60) {
                    pb.incrementProgressBy(1);
                    myHandler.postDelayed(myRun, 1000);
                }
                else if (pb.getProgress() == 60) {     // 프로그레스바가 60 도달 시 count 값을 Extra 공간에 넣어 보냄 (60까지 1초동안 진행 = 60초)
                    Intent it = new Intent();

                    String count = tv_count.getText().toString();

                    it.putExtra("count", count);
                    setResult(RESULT_OK, it);
                    finish();
                }
            }
        };
        runOnUiThread(myRun);

        int rand1 = new Random().nextInt(8)+2;  // 처음 실행 시 출력할 랜덤 함수
        int rand2 = new Random().nextInt(8)+2;

        result = rand1 * rand2;     // 랜덤 함수를 곱한 값을 저장한 변수

        tv_gugu.append(String.valueOf(rand1) + " * " + String.valueOf(rand2));  // 두 개의 난수를 곱셈 기호로 묶어 출력


        View.OnClickListener cl = new View.OnClickListener() {
            @Override
            public void onClick(View v) {   // 버튼 클릭시 해당 숫자를 출력해주는 메소드
                if(v == btn0) {
                    tv_answer.setText(tv_answer.getText().toString()+0);
                }
                else if(v == btn1){
                    tv_answer.setText(tv_answer.getText().toString()+1);
                }
                else if(v == btn2){
                    tv_answer.setText(tv_answer.getText().toString()+2);
                }
                else if(v == btn3){
                    tv_answer.setText(tv_answer.getText().toString()+3);
                }
                else if(v == btn4){
                    tv_answer.setText(tv_answer.getText().toString()+4);
                }
                else if(v == btn5){
                    tv_answer.setText(tv_answer.getText().toString()+5);
                }
                else if(v == btn6){
                    tv_answer.setText(tv_answer.getText().toString()+6);
                }
                else if(v == btn7){
                    tv_answer.setText(tv_answer.getText().toString()+7);
                }
                else if(v == btn8){
                    tv_answer.setText(tv_answer.getText().toString()+8);
                }
                else if(v == btn9){
                    tv_answer.setText(tv_answer.getText().toString()+9);
                }
                else if(v == btn_Enter) {   // Enter 버튼을 클릭 시 발생
                    int answer = Integer.valueOf(tv_answer.getText().toString());

                    if(result == answer) {  // 정답과 입력한 값이 일치할 시 수행
                        num++;
                        tv_count.setText("" + num);
                        tv_answer.setText("");
                        tv_gugu.setText("");

                        int rand1 = new Random().nextInt(9)+1;
                        int rand2 = new Random().nextInt(9)+1;
                        result = rand1 * rand2;
                        tv_gugu.append(String.valueOf(rand1) + " * " + String.valueOf(rand2));
                    }
                    else if(result != answer){  // 정답과 일치하지 않으면 수행
                        tv_answer.setText("");
                        Toast tMsg = Toast.makeText(SecondActivity.this, "정답이 아닙니다!", Toast.LENGTH_SHORT);
                        tMsg.show();
                    }
                }
                else if (v == btn_Cancel) {     // Cancel 버튼 클릭 시 정답 입력 칸을 비움
                    tv_answer.setText("");
                }
            }
        };
        btn0.setOnClickListener(cl); btn1.setOnClickListener(cl);
        btn2.setOnClickListener(cl); btn3.setOnClickListener(cl);
        btn4.setOnClickListener(cl); btn5.setOnClickListener(cl);
        btn6.setOnClickListener(cl); btn7.setOnClickListener(cl);
        btn8.setOnClickListener(cl); btn9.setOnClickListener(cl);
        btn_Enter.setOnClickListener(cl);
        btn_Cancel.setOnClickListener(cl);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();      // 옵션 메뉴 항목을 가져옴

        inflater.inflate(R.menu.second_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {

        if(item.getItemId() == R.id.menu1) {        // 옵션 메뉴 항목 중 EXIT 메뉴를 클릭 할 때 수행
            Intent intent = new Intent();

            String count = tv_count.getText().toString();

            intent.putExtra("count", count);
            setResult(RESULT_OK, intent);
            finish();
        }
        else if (item.getItemId() == R.id.menu2) {  // 옵션 메뉴 항목 중 RESTART 메뉴를 클릭 할 때 수행 (난수를 다시 발생, 정답 입력 칸과 정답 개수 칸을 비우고 0으로 초기화)
            tv_gugu.setText("");
            num = 0;
            int rand1 = new Random().nextInt(9)+1;
            int rand2 = new Random().nextInt(9)+1;
            result = rand1 * rand2;
            tv_gugu.append(String.valueOf(rand1) + " * " + String.valueOf(rand2));

            tv_answer.setText("");
            tv_count.setText("0");

            pb.setProgress(0);
        }
        return super.onOptionsItemSelected(item);
    }
}
