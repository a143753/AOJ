use std::io::BufRead;

fn f(a: i32, b: String) -> String {
    return b.to_string().repeat(a as usize);
}

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::new();
    reader
        .lock()
        .lines()
        .take(2)
        .for_each(|line| idt.push(line.unwrap()));

    let odt = f(idt[0].parse::<i32>().unwrap(), idt[1].to_string());
    println!("{}", odt);
}
