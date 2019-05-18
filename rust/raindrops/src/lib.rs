pub fn raindrops(n: u32) -> String {
    let mut output = "".to_string();
    if n % 3 == 0 {
        output = format!("{}{}", output, "Pling");
    }
    if n % 5 == 0 {
        output = format!("{}{}", output, "Plang");
    }
    if n % 7 == 0 {
        output = format!("{}{}", output, "Plong");
    }
    if output == "" {
        n.to_string()
    } else {
        output
    }
}
