use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::<i32>::new();

    reader.lock().lines().take(5).for_each(|line| {
        let d = line.unwrap().parse::<i32>().unwrap();
        idt.push(d);
    });

    println!(
        "{}",
        idt[0] * idt[1].pow(3) + idt[2] * idt[3] / idt[4] - 100
    );
}
