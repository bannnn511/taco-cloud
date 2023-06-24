package com.example.tacocloud;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import io.hypersistence.utils.hibernate.type.array.StringArrayType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Type;

@Data
@Entity
@NoArgsConstructor(access = AccessLevel.PUBLIC, force = true)
public class Taco {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ColumnDefault("NOW()")
    private Date createdAt = new Date();

    @NotNull
    @Size(min = 5, message = "Name must be at least 5 characters long")
    private String name;


    @Type(StringArrayType.class)
    @Column(
            name = "ingredient_ids",
            columnDefinition = "text[]"
    )
    private String[] ingredientIds;

    private String[] convertIngredientIds(List<Ingredient> ingredients) {
        return ingredients
                .stream()
                .map((Ingredient::getId))
                .toArray(String[]::new);
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredientIds = this.convertIngredientIds(ingredients);
    }
}
