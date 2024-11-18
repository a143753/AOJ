fn ans(h: i32, w: i32) {
    let mut str = String::new();

    for i in 0..h {
        for j in 0..w {
            if (i + j) % 2 == 0 {
                str.push('#');
            } else {
                str.push('.');
            }
        }
        str.push('\n');
    }
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
