use std::io::BufRead;

fn f(a: i32) -> i32 {
    return a + 1;
}

fn main() {
    let reader = std::io::stdin();

    let mut idt = 0;
    reader.lock().lines().take(1).for_each(|line| {
        idt = line.unwrap().parse::<i32>().unwrap();
    });

    let odt = f(idt);

    println!("{}", odt);
}
