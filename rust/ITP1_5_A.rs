fn ans(h: i32, w: i32) {
    let str = ("#".repeat(w as usize) + "\n").repeat(h as usize);
    println!("{}", str);
}

fn main() {
    loop {
        let mut buf = String::new();
        std::io::stdin().read_line(&mut buf).unwrap();
        let n = buf
            .trim()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<_>>();

        if n[0] == 0 && n[1] == 0 {
            break;
        }

        ans(n[0], n[1]);
    }
}
