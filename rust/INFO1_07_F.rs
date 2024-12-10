use std::io::BufRead;

fn min2(a: i32, b: i32) -> i32 {
    if a < b {
        return a;
    } else {
        return b;
    }
}

fn min3(a: i32, b: i32, c: i32) -> i32 {
    min2(min2(a, b), c)
}

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::new();

    reader.lock().lines().take(3).for_each(|line| {
        let str = line.unwrap();
        idt.push(str.parse::<i32>().unwrap());
    });

    let a = idt[0];
    let b = idt[1];
    let c = idt[2];

    println!("{}", min3(a, b, c));
}
