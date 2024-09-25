import prisma from '$lib/prisma';
import type { PageServerLoad } from './$types';

export const load = (async () => {
	const users = await prisma.user.findMany();
	const jobs = await prisma.job.findMany({ include: { applicant: true } });

return { jobs: jobs, users: users };
}) satisfies PageServerLoad;
