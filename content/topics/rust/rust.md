---
title: Rust
tags: [rust]
---
Rust is a blazingly fast (their claim, not mine) programming language, with safety as one of its main features.

# Type system
Rust's type system is extensible, and allows the compiler to check the codes validity.

Some personal favourites are the `Option` and `Result` types, and its incredible `enum`. In Rust, one can define an enum using the `enum` keyword

```rust
enum ExampleEnum {
    Value1,
    Value2(String),
    Value3 {}
}
```