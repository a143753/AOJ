use std::io::BufRead;

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

fn main() {
    let reader = std::io::stdin();
    let mut reader = reader.lock();
    let s = read_line(&mut reader);
    println!(
        "{}",
        s.chars()
            .map(|c| c.to_uppercase().next().unwrap())
            .collect::<String>()
    );
}
