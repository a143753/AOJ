use std::io::BufRead;

fn min(a: i32, b: i32) -> i32 {
    if a < b {
        return a;
    } else {
        return b;
    }
}

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::new();

    reader.lock().lines().take(2).for_each(|line| {
        let str = line.unwrap();
        idt.push(str.parse::<i32>().unwrap());
    });

    let a = idt[0];
    let b = idt[1];

    println!("{}", min(a, b));
}
