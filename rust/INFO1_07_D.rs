use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = 0;

    reader.lock().lines().take(1).for_each(|line| {
        idt = line.unwrap().parse::<i32>().unwrap();
    });

    let odt: String;
    if idt >= 80 {
        odt = "A".to_string();
    } else if idt >= 65 {
        odt = "B".to_string();
    } else if idt >= 50 {
        odt = "C".to_string();
    } else if idt >= 35 {
        odt = "D".to_string();
    } else {
        odt = "F".to_string();
    }

    println!("{}", odt);
}
