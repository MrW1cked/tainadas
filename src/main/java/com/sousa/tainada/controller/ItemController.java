package com.sousa.tainada.controller;

import com.sousa.tainada.model.Item;
import com.sousa.tainada.service.CsvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class ItemController {

    @Autowired
    private CsvService csvService;

    @PostMapping("/adicionar")
    public ResponseEntity<Item> adicionarItem(@RequestBody Item item) {
        csvService.guardarItem(item);
        return ResponseEntity.ok(item);
    }

    @GetMapping("/todos")
    public ResponseEntity<List<Item>> obterTodosOsItems() {
        List<Item> items = csvService.lerTodosOsItems();
        return ResponseEntity.ok(items);
    }
}
