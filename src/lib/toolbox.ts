export function pluralize(count: number, word: string) {
	if (count == 0) return null;
	return `${count} ${(count <= 1) ? word : `${word}s`}`;
}
