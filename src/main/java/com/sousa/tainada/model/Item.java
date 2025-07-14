package com.sousa.tainada.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {

    private Long id;
    private String nome;
    private String producto;
}
