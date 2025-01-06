---
title: Rust
tags: [rust]
---
Rust is a blazingly fast (their claim, not mine) programming language, with safety as one of its main features.

# Favourite Rust features
Rust's type system is extensible, and allows the compiler to check the codes validity.

Some personal favourites are the `Option` and `Result` types, and its incredible `enum`. In Rust, one can define an enum using the `enum` keyword

```rust
enum ExampleEnum {
    Value1, // Standard enum on other languages
    Value2(String), // Enum with an inner type
    Value3 {inner_value: u32} // Struct like values
}
```

The `enum` can be destructured with the `match` keyword

```rust
let enum_instance = ExampleEnum::Value1;

match enum_instance {
   ExampleEnum::Value1 => println!("Value 1"),
   ExampleEnum::Value2(s) => println!(format!("Value {s}"))
}
```