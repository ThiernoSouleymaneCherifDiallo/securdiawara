interface SidebarProps {
  mobile?: boolean;
  onClose?: () => void;
}

export default function DashboardSidebar({ mobile, onClose }: SidebarProps) {
  const pathname = usePathname();

  return (
    <div className="h-full bg-white border-r">
      <div className="flex items-center justify-between h-16 px-6 border-b">
        <h1 className="text-xl font-bold text-primary">SecurGuinee</h1>
        {mobile && (
          <button
            type="button"
            className="p-2 rounded-md text-gray-600 hover:text-gray-900"
            onClick={onClose}
          >
            <span className="sr-only">Fermer le menu</span>
            <svg
              className="h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
              strokeWidth="1.5"
              stroke="currentColor"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </button>
        )}
      </div>

      <nav className="mt-6 px-2">
        {menuItems.map((item) => (
          <Link
            key={item.path}
            href={item.path}
            className={`
              flex items-center px-4 py-2 mt-2 text-gray-600 rounded-lg
              hover:bg-gray-100 hover:text-primary
              ${pathname === item.path ? 'bg-primary/5 text-primary' : ''}
            `}
            onClick={mobile ? onClose : undefined}
          >
            <item.icon className="h-5 w-5" />
            <span className="mx-4">{item.title}</span>
          </Link>
        ))}
      </nav>
    </div>
  );
} 