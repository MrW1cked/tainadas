package com.sousa.tainada.service;

import com.sousa.tainada.model.Item;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

@Service
public class CsvService {

    private static final String CSV_FILE_PATH = "src/main/resources/dados.csv";

    public void guardarItem(Item item) {
        try {
            Path path = Paths.get(CSV_FILE_PATH);
            String linha = item.getNome() + "," + item.getProducto() + "\n";
            Files.write(path, linha.getBytes(), StandardOpenOption.APPEND);
        } catch (IOException e) {
            throw new RuntimeException("Erro ao guardar no ficheiro CSV", e);
        }
    }

    public List<Item> lerTodosOsItems() {
        List<Item> items = new ArrayList<>();
        try {
            Path path = Paths.get(CSV_FILE_PATH);
            if (!Files.exists(path)) {
                return items;
            }

            List<String> linhas = Files.readAllLines(path);
            long id = 1;

            for (String linha : linhas) {
                if (!linha.trim().isEmpty()) {
                    String[] dados = linha.split(",");
                    if (dados.length >= 2) {
                        // Verifica se não é o cabeçalho
                        if (!dados[0].trim().equals("nome")) {
                            Item item = new Item();
                            item.setId(id++);
                            item.setNome(dados[0].trim());
                            item.setProducto(dados[1].trim());
                            items.add(item);
                        }
                    }
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Erro ao ler do ficheiro CSV", e);
        }
        return items;
    }
}
