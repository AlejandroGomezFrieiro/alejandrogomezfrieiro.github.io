---
title: Rust
tags: [rust]
---
Rust is a blazingly fast (their claim, not mine) programming language, with safety as one of its main features.

> [!note]
Some of the code here might not be correct, as I wrote it quickly without checking, but it should be sufficiently close to convey the message

# Favourite Rust features

## Tooling
Coming from a Python background, which has a broken tooling system with several implementations of a package manager, Rust is a breath of fresh air.

- cargo: Package manager
- clippy: Linter
- rustfmt: Formatting
- rust-analyzer: The main Rust LSP

## Type system and match statements
Rust's type system is extensible, and allows the compiler to check the code's validity.

Some personal favourites are the `Option` and `Result` types, and its incredible `enum`. In Rust, one can define an enum using the `enum` keyword

```rust
enum ExampleEnum {
    Value1, // Standard enum on other languages
    Value2(String), // Enum with an inner type
    Value3 {inner_value: u32} // Struct like values
}
```

The `enum` can be destructured with the `match` keyword.

```rust
let enum_instance = ExampleEnum::Value1;

match enum_instance {
   ExampleEnum::Value1 => println!("Value 1"),
   ExampleEnum::Value2(s) => println!(format!("Value 2: {s}")),
   ExampleEnum::Value3 {inner_value} =>println!(format!("Value 3: {inner_value}"))
}
```

Since `Option` and `Result` are also `enum`, it is common to destructure them

```rust
match optional_value {
   None => println!("None"),
   Some(value) => println!(format!({value}))
}
```

## maturin and PyO3
We can now publish Python packages that use Rust using `maturin` and `pyo3`. Rust powers some of qiskit and [pydantic](https://pydantic.dev/).

[Maturin](https://www.maturin.rs/)

# The hard truth

Rust is great, but is also hard to learn and use for non-CS folks. Many people in the science community are used to Python, often without type hints.

Sometimes Rust can also become quite verbose, and while the compiler is your friend (most of the time), sometimes one must do non-idiomatic things to make the compiler happy. Some call it [Easy Mode Rust](https://llogiq.github.io/2024/03/28/easy.html).

Rust is a great tool but might not be the ideal tool for all usecases. It is great for production-level, but might be overkill for more explorative efforts (like notebook-style programming, widely used in Data Science and Quantum Computing along others), or when designing/drafting a project.

# References
- [Awesome Rust Tools](https://github.com/unpluggedcoder/awesome-rust-tools): Collection of tools written in Rust.
- [Official Learn Rust](https://www.rust-lang.org/learn).
- [Awesome Rust resources](https://github.com/rust-unofficial/awesome-rust?tab=readme-ov-file#resources)