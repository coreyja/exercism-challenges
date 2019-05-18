pub fn build_proverb(list: &[&str]) -> String {
    if list.len() > 0 {
        let mut output = "".to_string();
        for i in 0..list.len() - 1 {
            let string = format!("For want of a {} the {} was lost.", list[i], list[i + 1]);
            output = format!("{}{}\n", output, string);
        }
        format!("{}And all for the want of a {}.", output, list[0])
    } else {
        "".to_string()
    }
}
