package com.example.gugudan_201607057baekseunghyun;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    ListView lv;
    ArrayAdapter<String> adapter;
    List<String> arrayData;

    private static final int RQCODE_INSERT = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setTitle("201607057 백승현 (구구단)");

        lv = (ListView) findViewById(R.id.list_insert);

        arrayData = new ArrayList<>();
        adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, arrayData);

        lv.setAdapter(adapter);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main_menu, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {

        Intent i = new Intent(this, SecondActivity.class);

        if(item.getItemId() == R.id.menu1) {
            startActivityForResult(i, RQCODE_INSERT);
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {   // onActivityResult를 이용해 SecondActivity에서 저장한 값을 반환 받아 출력
        super.onActivityResult(requestCode, resultCode, data);

        if(requestCode == RQCODE_INSERT) {
            if(resultCode == RESULT_OK) {
                String count = data.getStringExtra("count");    // count 변수에 SecondActivity에서 지정한 key값을 넘겨받아 저장
                arrayData.add(count);   // arrayData 배열에 count에 저장된 값을 차례대로 add
                adapter.notifyDataSetChanged(); // 어댑터 갱신
            }
        }
    }
}